Facter.add(:uptime) do
  confine :kernel => 'Darwin'
  setcode do
    Facter::Core::Execution.exec('/usr/bin/uptime')
  end
end
