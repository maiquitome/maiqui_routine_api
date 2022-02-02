defmodule MaiquiRoutine.ColourPalettes do
  alias MaiquiRoutine.ColourPalettes.Create

  defdelegate create(params), to: Create, as: :call
end
