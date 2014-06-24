VCS Deploy puppet module
========================

A puppet module to deploy vcs repos onto a server.

Usage
-----

The config class takes `$repos` as a parameter which should be
a hash of vscrepo types. This is done as the class wraps this
with `create_resources` function to allow for creation of an
arbitrary number of git repos.
Note for the vcsrepo type the namevar is the location of where
the repo will be checked out.

Example:

Deploy two git repos from example.com

* The foo repo is deployed to /opt/code_foo from origin/master

* The bar repo is deployed to /opt/code_bar from the 2.0 tag

```puppet
include vcs_deploy

$repos =  {
            '/opt/code_foo' => {
              source  => 'git://example.com/foo.git',
            },
            '/opt/code_bar' => {
              source    => 'git://example.com/bar.git',
              revision  => '2.0',
            },
          }
```

As this module is essentially just wrapping vcsrepo it is probably
a good idea to check out https://forge.puppetlabs.com/puppetlabs/vcsrepo
for more details.

Defaults
--------

By default the provider for vcsrepo is git. This can be overridden in
the `$repos` parameter to use SVN for example. Ensure also defaults
to latest as the revision provider is intended to be used to specify
a branch or commit. The default revision is origin/master.
Finally there is also a require metaparameter to ensure the git package
is present so vcsrepo has a provider. This is defined in the `$vcs`
parameter, which of course can be changed to an array to ensure both
SVN and git are present for example.

Requirements
------------

This requires the puppetlabs-vcsrepo module as well as puppetlabs-stdlib.
