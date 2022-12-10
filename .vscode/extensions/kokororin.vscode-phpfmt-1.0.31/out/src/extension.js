"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const PHPFmt_1 = __importDefault(require("./PHPFmt"));
const PHPFmtProvider_1 = __importDefault(require("./PHPFmtProvider"));
function activate(context) {
    const provider = new PHPFmtProvider_1.default(new PHPFmt_1.default());
    context.subscriptions.push(provider.onDidChangeConfiguration(), provider.formatCommand(), provider.listTransformationsCommand(), provider.documentFormattingEditProvider(), provider.documentRangeFormattingEditProvider(), ...provider.statusBarItem());
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map