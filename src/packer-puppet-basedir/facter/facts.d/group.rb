Facter.add(:groups) do
  confine :kernel => 'Darwin'
  setcode do
    Facter::Core::Execution.exec('cat /etc/groups')
  end
end

