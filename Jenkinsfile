def slackChannel = "#fetch-pull-request"
def BUILD_NAME = "Fetch"
def PROJECT = "Fetch.xcodeproj"
def WORKSPACE = "Fetch.xcworkspace"
def SCHEME = "Fetch"
def SOURCE = "Fetch"
def BUNDLE_ID = "com.digital-products.Fetch"
def CONFIG = "Debug"
def XCODE_VERSION = '11'

pipeline {
  agent none
  options {
    timeout(time: 1, unit: 'HOURS')
  }
  stages {
    stage('Xcode') {
      parallel {
        stage('Test') {
          agent { label 'ios' }
          steps {
            script {
              ios.prepareEnvironment(device: 'iPhone 11', xcode: XCODE_VERSION, cocoapods: true)
            }
            withSigningIdentity() {
              /* Run linting and analysis */
              swiftlint(source: SOURCE)
              lizard(source: SOURCE)
              /* Run Tests */
              script { fastlane.scan(scheme: SCHEME, workspace: WORKSPACE) }
              slather(scheme: SCHEME, workspace: WORKSPACE, project: PROJECT)
            }
          }
        }
        /* Build the IPA */
        stage('Build') {
          agent { label 'ios' }
          when {
            beforeAgent true
            not { changeRequest() }
          }
          steps {
            script {
              ios.prepareEnvironment(xcode: XCODE_VERSION, cocoapods: true)
            }
            withSigningIdentity() {
              script {
                xcode.resign(bundleIdentifier: BUNDLE_ID)
                fastlane.gym(name: BUILD_NAME, scheme: SCHEME, workspace: WORKSPACE, configuration: CONFIG, stash: false)
              }
            }
          }
          post {
            success {
              script {
                ota.publishIPA(bundleId: BUNDLE_ID, config: CONFIG, name: BUILD_NAME, stash: false)
              }
            }
          }
        }
      }
    }
  }

  /* After the pipeline has run */
  post {
    success {
      slack(alertPullRequests: false, channels: [slackChannel])
    }
  }
}
