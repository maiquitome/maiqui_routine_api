defmodule MaiquiRoutine.ColourPalettes do
  alias MaiquiRoutine.ColourPalettes.{Create, GetByName}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_name(name), to: GetByName, as: :call
end
