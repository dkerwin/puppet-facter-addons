Facter.add(:system_profile) do
    confine :operatingsystem => :Gentoo
    setcode do
        profile = nil
        output = %x{/usr/bin/eselect --brief --no-color profile show | tr -d ' '}
        profile = output.chop!
        profile
    end
end

