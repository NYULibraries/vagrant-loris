Facter.add(:role) do
  confine :kernel => 'Darwin'
  setcode do
    Facter::Core::Execution.exec('/usr/bin/echo kenny')
  end
end
