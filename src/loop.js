import {getVersion} from './get-version.js';
import {getMissingDependency} from './get-missing-dependency.js';
import {createFileWhenNotExist} from './create-file-when-not-exist.js';
import process from 'node:process';
import {resizeFile} from './resize-file.js';

export const loop = async (file, size, overrides = {}) => {
    const {exit = process.exit, log = console.log} = overrides;
    
    if (/^(-v|--version)$/.test(file)) {
        const version = getVersion();
        
        log(`v${version}`);
        return exit(0);
    }
    
    if (!file || !size) {
        log('loop <file> <size>');
        return exit(0);
    }
    
    const missing = await getMissingDependency();
    
    if (missing) {
        log(`'${missing}' is missing, please install it`);
        return exit(1);
    }
    
    await createFileWhenNotExist(file, size);
    await resizeFile(file, size);
};
