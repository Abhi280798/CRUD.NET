import vscode from 'vscode';
import { Installable } from '../utils/installable';
export interface VueExtensionSettings {
    blocks: Record<string, {
        default: string;
        allowed: string[];
    }>;
}
export declare class ConfigurationService extends Installable {
    private _config;
    private readonly emitter;
    constructor();
    get config(): VueExtensionSettings;
    private read;
    install(): vscode.Disposable;
    readonly onConfigChange: vscode.Event<VueExtensionSettings>;
    save<K extends keyof VueExtensionSettings>(name: K, value: VueExtensionSettings[K]): Promise<void>;
    private prepare;
}
//# sourceMappingURL=configuration.d.ts.map