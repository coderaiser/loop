import {$} from 'zx';
import tryToCatch from 'try-to-catch';

const wrapTag = (tag) => (arg) => tag({quiet: true})`${arg}`;
const $$ = wrapTag($);

export const hasFailed = async (command) => {
    const [error] = await tryToCatch($$, `eval ${command}`);
    return Boolean(error);
};

export const fileExist = async (name) => {
    const [error] = await tryToCatch($$, `[ -f "${name}" ]`);
    return Boolean(error);
};
