'use strict';
import ElixirScript from './ElixirScript.Core.js';
function __info__(kind) {
    const __info__map__ = new Map([[Symbol.for('functions'), [new ElixirScript.Core.Tuple(Symbol.for('call'), 0)]], [Symbol.for('macros'), []], [Symbol.for('attributes'), [new ElixirScript.Core.Tuple(Symbol.for('vsn'), [229004388435042033765679972291745470322])]], [Symbol.for('compile'), [new ElixirScript.Core.Tuple(Symbol.for('version'), [56, 46, 48, 46, 52]), new ElixirScript.Core.Tuple(Symbol.for('options'), [Symbol.for('no_spawn_compiler_process'), Symbol.for('from_core'), Symbol.for('no_core_prepare'), Symbol.for('no_auto_import')]), new ElixirScript.Core.Tuple(Symbol.for('source'), '/home/silvan/code/elixir/ephemeral/lib/ephemeral_web/components/copy_to_clipboard.ex')]], [Symbol.for('md5'), new ElixirScript.Core.BitString(ElixirScript.Core.BitString.integer(172), ElixirScript.Core.BitString.integer(72), ElixirScript.Core.BitString.integer(164), ElixirScript.Core.BitString.integer(18), ElixirScript.Core.BitString.integer(145), ElixirScript.Core.BitString.integer(53), ElixirScript.Core.BitString.integer(142), ElixirScript.Core.BitString.integer(99), ElixirScript.Core.BitString.integer(159), ElixirScript.Core.BitString.integer(11), ElixirScript.Core.BitString.integer(239), ElixirScript.Core.BitString.integer(138), ElixirScript.Core.BitString.integer(229), ElixirScript.Core.BitString.integer(12), ElixirScript.Core.BitString.integer(215), ElixirScript.Core.BitString.integer(114))], [Symbol.for('module'), Symbol.for('Elixir.EphemeralWeb.Component.CopyToClipboard.JS')]]);

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

            return ElixirScript.Core.Patterns.defmatch(ElixirScript.Core.Patterns.clause([false], () => {
                return document.documentElement.style.setProperty('--copy-to-clipboard', 'none');
            }, () => {
                return true;
            }), ElixirScript.Core.Patterns.clause([true], () => {
                return window.addEventListener('copy_to_clipboard', (...__function_args__) => {
                    function recur(...__function_args__) {
                        let __arg_matches__ = null;

                        if ((__arg_matches__ = ElixirScript.Core.Patterns.match_or_default([ElixirScript.Core.Patterns.variable('event')], __function_args__, (event0) => {
                            return true;
                        })) !== null) {
                            let [event0] = __arg_matches__;

                            return window.navigator.clipboard.writeText(ElixirScript.Core.Functions.call_property(ElixirScript.Core.Functions.call_property(event0, 'target'), 'textContent'));
                        }

                        throw new ElixirScript.Core.Patterns.MatchError(__function_args__);
                    }

                    return ElixirScript.Core.Functions.trampoline(new ElixirScript.Core.Functions.Recurse(recur.bind(null, ...__function_args__)));
                });
            }, () => {
                return true;
            })).call(this, window.navigator.clipboard != null);
        }

        throw new ElixirScript.Core.Patterns.MatchError(__function_args__);
    }

    return ElixirScript.Core.Functions.trampoline(new ElixirScript.Core.Functions.Recurse(recur.bind(null, ...__function_args__)));
}

export default {
    call,
    __MODULE__: Symbol.for('Elixir.EphemeralWeb.Component.CopyToClipboard.JS'),
    __info__
};
