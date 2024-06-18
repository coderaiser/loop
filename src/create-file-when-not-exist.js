import {fileExist} from './std.js';
import tryToCatch from 'try-to-catch';
import {$} from 'zx';

export const createFileWhenNotExist = async (file) => {
    if (await fileExist(file))
        return $`mkfs.ext4 "${file}"`;
    
    const [fallocateError] = await tryToCatch($`fallocate -l "{size}" "{file}"`);
    
    if (!fallocateError)
        return;
    
    return await $`dd if=/dev/zero of="{file}" bs="{size}" seek=1 count=0`;
};
