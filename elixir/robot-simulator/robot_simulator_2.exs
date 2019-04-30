defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @valid_directions [:north, :east, :south, :west]
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      not valid_direction?(direction) &&
          not valid_position?(position) -> {:error, "invalid direction & position"}
      not valid_direction?(direction)   -> {:error, "invalid direction"}
      not valid_position?(position)     -> {:error, "invalid position"}
      true  -> %{direction: direction, position: position}
    end
  end

  defp valid_direction?(direction) do
    Enum.member?(@valid_directions, direction)
  end

  defp valid_position?(position) when not is_tuple(position), do: false
  defp valid_position?(position) do
    position_list  = position      |> Tuple.to_list
    dimensions     = position_list |> Enum.count
    all_integers?  = position_list |> Enum.all?(&is_integer/1)
    all_integers? && (dimensions == 2)
  end

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

  defp do_action(robot, current_direction, "L") do
    turn_left = %{north: :west, east: :north, south: :east, west: :south}
    new_diection  =  turn_left[ current_direction ]
    %{direction: new_diection,  position: robot[:position]}
  end
  defp do_action(robot, current_direction, "R") do
    turn_right = %{north: :east, east: :south, south: :west, west: :north}
    new_diection  =  turn_right[ current_direction ]
    %{direction: new_diection,  position: robot[:position]}
  end
  defp do_action(robot, :north, "A"), do: %{direction: :north, position: { elem(robot[:position], 0),   elem(robot[:position], 1)+1 } }
  defp do_action(robot, :east,  "A"), do: %{direction: :east,  position: { elem(robot[:position], 0)+1, elem(robot[:position], 1) } }
  defp do_action(robot, :south, "A"), do: %{direction: :south, position: { elem(robot[:position], 0),   elem(robot[:position], 1)-1} }
  defp do_action(robot, :west,  "A"), do: %{direction: :west,  position: { elem(robot[:position], 0)-1, elem(robot[:position], 1) } }
  defp do_action(_, _, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end
end
