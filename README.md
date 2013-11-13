[![Build Status]( https://travis-ci.org/tcbeutler/TravisCITest.png)](https://travis-ci.org/tcbeutler/TravisCITest)

[GitHub Pages Coverage Results](http://tcbeutler.github.io/TravisCITest/)

[hasdocs Coverage Results](http://tcbeutler.hasdocs.com/TravisCITest/)

# Travis CI Testing


##Travis docs - useful links

* [Travis Documentation](http://about.travis-ci.org/docs/)


###Breakdown

1. Service Hook - Travis CI to GitHub

    a. [One-click after GitHub login. All branches at once.](https://raw.github.com/tcbeutler/TravisCITest/gh-pages/images/img1.png)

    b. Add [.travis.yml](https://github.com/tcbeutler/TravisCITest/blob/master/.travis.yml) file to project root directory.


2. Unit Tests - Mocha

    a. Set up "npm test" command - this is what Travis runs

    b. Call local installation of mocha, global throws permission errors

    c. Travis posts success/failure/unknown image - can embed in this README (see above.)


3. Code Coverage - Istanbul

    a. Install Istanbul, Istanbul hooks into Mocha, instruments code from tests, and produces code coverage results.

    > * Only instruments code referenced from unit tests.

    b. Tell Travis to execute coverage tests, produces output as [html](http://tcbeutler.github.io/TravisCITest/).

    c. TravisCI does not host files, so possible solution is to post back to a GitHub repository using [encrypted OAuth token with Travis's public key](http://about.travis-ci.org/docs/user/encryption-keys/).

    d. Travis can post back to GitHub, see [script](https://github.com/tcbeutler/TravisCITest/blob/master/coverage/copy_coverage_to_repo.sh) example. Possibly
    can use Travis's [environment variables](http://about.travis-ci.org/docs/user/ci-environment/) to post back to correct branch, OR separate branch for coverage results,
    and have Travis create a directory for each branch.

    > * echo ${TRAVIS_BRANCH} = "master"

    > * echo ${TRAVIS_REPO_SLUG} = "https://github.com/tcbeutler/TravisCITest"

4. Viewing Code Coverage Results

    a. GitHub cannot display pages hosted in a normal repository.

    b. [GitHub Pages](http://pages.github.com/) hosts a public website from any branch added to a repo called "gh-pages".

    > GitHub pages are always public and served over http.

    c. [hasdocs provides privately hosted documentation with GitHub service hook](http://www.hasdocs.com/tcbeutler/) for ~$5 a month.

    d. Alternatively could host own service to pull and serve coverage results.
