import {hasFailed} from './std.js';
import {$} from 'zx';

const names = [
    'fallocate',
    'mkfs.ext4',
    'e2fsck',
    'resize2fs',
];

export const getMissingDependency = async function() {
    for (const name of names) {
        if (!$.sync()`command -v ${name}`)
            return name;
    }
    
    return '';
};
