@Library('piper-lib-os') _

pipeline {
    agent any
    stages {
    stage ('Setup') {
        steps {
            setupCommonPipelineEnvironment(
                collectTelemetryData: 'false',
                verbose: 'true',
                script: this
                )
        } // steps
    } //stage
    } //stages
} //pipeline
