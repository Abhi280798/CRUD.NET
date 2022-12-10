import vscode from 'vscode';
import { ConfigurationService } from '../services/configuration';
import { Installable } from '../utils/installable';
export declare class GenerateGrammarCommand extends Installable {
    private readonly configuration;
    private readonly context;
    private readonly rootDir;
    private isActive;
    private blocks;
    private readonly supported;
    constructor(configuration: ConfigurationService, context: vscode.ExtensionContext);
    install(): vscode.Disposable;
    private isVueFile;
    private checkIfNewLanguage;
    private readonly onExecute;
    private generate;
}
//# sourceMappingURL=generateGrammar.d.ts.map