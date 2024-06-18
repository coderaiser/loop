import process from 'node:process';
import {loop} from './loop.js';

const [file, size] = process.argv.slice(2);
await loop(file, size);
