import {tryToCatch} from 'try-to-catch';
import {$} from 'zx';
import {fileExist} from './std.js';

export const createFileWhenNotExist = async (file) => {
    if (await fileExist(file))
        return $.sync`mkfs.ext4 "${file}"`;
    
    const [fallocateError] = await tryToCatch($.sync, `fallocate -l "{size}" "{file}"`);
    
    if (!fallocateError)
        return;
    
    return await $.sync`dd if=/dev/zero of="{file}" bs="{size}" seek=1 count=0`;
};
