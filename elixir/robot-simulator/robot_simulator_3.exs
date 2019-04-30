defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @valid_directions [:north, :east, :south, :west]

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  # define default values
  def create(direction \\ :north, position \\ {0, 0})
  # validate direction
  def create(direction, _) when direction not in @valid_directions, do: {:error, "invalid direction"}
  # validate position
  def create(_, position) when not is_tuple(position), do: {:error, "invalid position"}
  def create(_, position) when 2 != Kernel.tuple_size(position), do: {:error, "invalid position"}
  def create(_, {x,y}) when (not is_integer(x)) or (not is_integer(y)), do: {:error, "invalid position"}
  # actually create robot when valid
  def create(direction, position), do: %{direction: direction, position: position}

  # @doc """
  # Simulate the robot's movement given a string of instructions.
  #
  # Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  # """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    actions_list = instructions |> String.codepoints
    next_action(robot, actions_list)
  end

  defp next_action({:error, error_message}, _), do: {:error, error_message}
  defp next_action(robot, [head | []]),  do: do_action(robot, robot[:direction], head)
  defp next_action(robot, [head | tail]) do
    updated_robot = do_action(robot, robot[:direction], head)
    next_action(updated_robot, tail)
  end

  # turn left action
  defp do_action(robot, current_direction, "L") do
    turn_left = %{north: :west, east: :north, south: :east, west: :south}
    new_direction  =  turn_left[ current_direction ]
    %{robot | direction: new_direction }
    #%{direction: new_diection,  position: robot[:position]}
  end
  # turn right action
  defp do_action(robot, current_direction, "R") do
    turn_right = %{north: :east, east: :south, south: :west, west: :north}
    new_direction  =  turn_right[ current_direction ]
    %{robot | direction: new_direction }
    #%{direction: new_diection,  position: robot[:position]}
  end
  # advance in a direction actions
  defp do_action(robot, :north, "A"), do: %{ robot | position: { elem(robot[:position], 0), elem(robot[:position], 1)+1 } }
  defp do_action(robot, :east,  "A"), do: %{ robot | position: { elem(robot[:position], 0)+1, elem(robot[:position], 1) } }
  defp do_action(robot, :south, "A"), do: %{ robot | position: { elem(robot[:position], 0),   elem(robot[:position], 1)-1} }
  defp do_action(robot, :west,  "A"), do: %{ robot | position: { elem(robot[:position], 0)-1, elem(robot[:position], 1) } }
  defp do_action(_, _, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: dir}), do: dir
  # def direction(robot), do: robot[:direction]

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: pos}), do: pos
  # def position(robot), do: robot[:position]
end
