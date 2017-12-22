Facter.add(:factuser) do
  confine :kernel => 'Darwin'
  setcode do
    Facter::Core::Execution.exec('/bin/echo myfactusername')
  end
end
