import {run} from 'madrun';

export default {
    "start":() => './bin/loop.sh',
    "lint": () => run('lint:*'),
    "lint:js": () => 'putout .',
    'lint:bash': () => `docker run --rm -v "$PWD:/mnt" koalaman/shellcheck lib/*.sh bin/*.sh`,
    'fix:lint': () => run('lint', '--fix'),
    "docker:build":() => 'docker build . -t coderaiser/loop:`version`',
    "postdocker:build":() => 'docker tag coderaiser/loop:`version` coderaiser/loop:latest',
    "rm:docker":() => 'docker rmi -f coderaiser/loop:`version`',
    "docker:push":() => 'docker push coderaiser/loop:`version`',
    "postdocker:push":() => 'docker push coderaiser/loop:latest',
    "build":() => run('docker:build'),
    "build:all":() => run('docker:*'),
    "wisdom:done":() => run('build:all'),
    "wisodm":() => run('lint'),
    "prewisdom":async () => await run(['rm:*', 'rm:docker']),
    "rm:package-lock":() => 'rm -f package-lock.json',
    "watcher":() => 'nodemon -w . -e sh --exec',
    "watch:lint":() => run('watcher', '\'npm run lint\'')
};
