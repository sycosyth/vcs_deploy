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

  # Dependancy to ensure the vcs provider is installed.
  # Using a class as functions cannot be part of dependancy chains.

  class install {

    package { $vcs_deploy::vcs :
    ensure => present,
    }

  }

  contain 'vcs_deploy::install'

  Vcs_deploy {
  require => Class['vcs_deploy::install']
  }

  # Create the repos

  create_resources(vcsrepo, $repos, $defaults)

}
