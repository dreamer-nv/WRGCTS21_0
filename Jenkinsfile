@Library('piper-lib-os') _

pipeline {
    agent any
    stages {
    stage ('Setup') {
        steps {
            setupCommonPipelineEnvironment script: this
        } // steps
    } //stage
        stage ('Deploy Commit') {
            steps {
                gctsDeploy script: this
            } //steps
        } // stage
        stage ('Execute Unit Tests') {
            steps {
                script {
                    checks_failed = false
                    try {
                        gctsExecuteABAPUnitTests script: this
                    } catch (err) {
                        unstable('AUnit test failed!')
                        checks_failed = true
                    }
                } // script
            }
        } // stage
        stage ('ATC checks') {
            steps {
                script {
                    abapEnvironmentRunATCCheck script: this
                    def checkstyle = scanForIssues tool: checkStyle(pattern: 'ATCResults.xml')
                    publishIssues issues: [checkstyle], failedTotalAll: 1
                    if ( currentBuild.result == 'FAILURE' ) {
                        echo 'ATC failed!'
                        checks_failed = true
                    } // if
                }
            } // steps
        } // stage
        stage ('Rollback Commit') {
            when { expression { checks_failed == true } }
            steps {
                gctsRollback script: this
            } // steps
        } // stage
        stage ('Build success') {
            when { expression { checks_failed == false } }
            steps {
                echo 'Build success!'
            } // steps
        } // stage        
    } //stages
} //pipeline
