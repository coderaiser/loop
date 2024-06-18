import {$} from 'zx';

export const resizeFile = (file, size) => {
    $`
        e2fsck -fy "${file}"
        resize2fs "${file}" "${size}"
    `;
};

