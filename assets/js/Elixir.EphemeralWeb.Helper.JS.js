'use strict';
import ElixirScript from './ElixirScript.Core.js';
import $EphemeralWeb$Component$CopyToClipboard$JS$ from './Elixir.EphemeralWeb.Component.CopyToClipboard.JS.js';

function __info__(kind) {
    const __info__map__ = new Map([[Symbol.for('functions'), [new ElixirScript.Core.Tuple(Symbol.for('call'), 0)]], [Symbol.for('macros'), []], [Symbol.for('attributes'), [new ElixirScript.Core.Tuple(Symbol.for('vsn'), [305335377026048131656033950467826033232])]], [Symbol.for('compile'), [new ElixirScript.Core.Tuple(Symbol.for('version'), [56, 46, 48, 46, 52]), new ElixirScript.Core.Tuple(Symbol.for('options'), [Symbol.for('no_spawn_compiler_process'), Symbol.for('from_core'), Symbol.for('no_core_prepare'), Symbol.for('no_auto_import')]), new ElixirScript.Core.Tuple(Symbol.for('source'), '/home/silvan/code/elixir/ephemeral/lib/ephemeral_web/helper/js.ex')]], [Symbol.for('md5'), new ElixirScript.Core.BitString(ElixirScript.Core.BitString.integer(229), ElixirScript.Core.BitString.integer(181), ElixirScript.Core.BitString.integer(116), ElixirScript.Core.BitString.integer(94), ElixirScript.Core.BitString.integer(171), ElixirScript.Core.BitString.integer(20), ElixirScript.Core.BitString.integer(37), ElixirScript.Core.BitString.integer(168), ElixirScript.Core.BitString.integer(44), ElixirScript.Core.BitString.integer(197), ElixirScript.Core.BitString.integer(43), ElixirScript.Core.BitString.integer(63), ElixirScript.Core.BitString.integer(34), ElixirScript.Core.BitString.integer(218), ElixirScript.Core.BitString.integer(162), ElixirScript.Core.BitString.integer(80))], [Symbol.for('module'), Symbol.for('Elixir.EphemeralWeb.Helper.JS')]]);

    const value = __info__map__.get(kind);

    if (value !== null) {
        return value;
    }

    throw new ElixirScript.Core.Patterns.MatchError(kind);
}

function call(...__function_args__) {
    function recur(...__function_args__) {
        let __arg_matches__ = null;

        let __intermediate__ = null;

        if ((__arg_matches__ = ElixirScript.Core.Patterns.match_or_default([], __function_args__, () => {
            return true;
        })) !== null) {
            let [] = __arg_matches__;

            return [ElixirScript.Core.Functions.call_property($EphemeralWeb$Component$CopyToClipboard$JS$.call)];
        }

        throw new ElixirScript.Core.Patterns.MatchError(__function_args__);
    }

    return ElixirScript.Core.Functions.trampoline(new ElixirScript.Core.Functions.Recurse(recur.bind(null, ...__function_args__)));
}

export default {
    call,
    __MODULE__: Symbol.for('Elixir.EphemeralWeb.Helper.JS'),
    __info__
};
