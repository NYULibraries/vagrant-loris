Facter.add(:rubypath) do
  setcode 'which ruby'
end

