# This takes the parameter $repos as a hash, the parameters for which
# are the same as the vsc repo type.

class vcs_deploy

(
$repos = undef,
$vcs = 'git',
$defaults = { provider => 'git', ensure => latest, revision => 'origin/master'},
)

{

  # Use stdlib validation to fail quickly and give an obvious error if
  # the data being passed to vcsrepo is not valid.

  validate_hash($repos, $defaults)

  # Create the repos

  create_resources(vcsrepo, $repos, $defaults)

}
