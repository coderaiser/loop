import {hasFailed} from './std.js';

const names = [
    'fallocate',
    'mkfs.ext4',
    'e2fsck',
    'resize2fs',
];

export const getMissingDependency = async function() {
    for (const name of names) {
        if (await hasFailed(name))
            return name;
    }
    
    return '';
};
