defmodule MaiquiRoutine.ColourPalettes do
  alias MaiquiRoutine.ColourPalettes.{Create, GetByName, GetById}

  defdelegate create(params), to: Create, as: :call
  defdelegate get_by_name(name), to: GetByName, as: :call
  defdelegate get_by_id(id), to: GetById, as: :call
end
