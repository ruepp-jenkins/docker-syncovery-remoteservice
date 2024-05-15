properties(
    [
        githubProjectProperty(
            displayName: 'docker-syncovery-remoteservice',
            projectUrlStr: 'https://github.com/MyUncleSam/docker-syncovery-remoteservice/'
        )
    ]
)

pipeline {
    agent {
        label 'docker'
    }
    environment {
        IMAGE_FULLNAME = 'stefanruepp/syncoveryremote'
    }
    triggers {
        URLTrigger(
            cronTabSpec: 'H/30 * * * *',
            entries: [
                URLTriggerEntry(
                    url: 'https://www.syncovery.com/linver_RS-x86_64.tar.gz.txt',
                    contentTypes: [
                        MD5Sum()
                    ]
                ),
                URLTriggerEntry(
                    url: 'https://www.syncovery.com/linver_RS-aarch64.tar.gz.txt',
                    contentTypes: [
                        MD5Sum()
                    ]
                ),
                URLTriggerEntry(
                    url: 'https://hub.docker.com/v2/namespaces/library/repositories/ubuntu/tags/24.04',
                    contentTypes: [
                        JsonContent(
                            [
                                JsonContentEntry(jsonPath: '$.last_updated')
                            ]
                        )
                    ]
                )
            ]
        )
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: env.BRANCH_NAME, url: env.GIT_URL
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x scripts/*.sh'
                sh './scripts/start.sh'
            }
        }
    }
}
