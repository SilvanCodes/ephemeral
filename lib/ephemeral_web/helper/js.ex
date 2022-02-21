defmodule EphemeralWeb.Helper.JS do
  defmodule Precompile do
    defmacro __before_compile__(env) do
      js_modules = Module.get_attribute(env.module, :js_modules)

      js_module_calls =
        js_modules
        |> Enum.map(&call_js_module/1)

      quote do
        def call do
          unquote(js_module_calls)
        end
      end
    end

    defp call_js_module(module) do
      quote do
        unquote(module).call()
      end
    end
  end

  @before_compile Precompile

  @js_modules [EphemeralWeb.Component.CopyToClipboard.JS]
end
