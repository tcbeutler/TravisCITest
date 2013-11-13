if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Pushing code coverage data to git.\n"

  #copy data we're interested in to other place
  cp -r coverage $HOME/coverage

  git clone --quiet --branch=master https://2010976e1624b3640941858b87501f4560066125@github.com/tcbeutler/TravisCITest.git coverage_checkout > /dev/null

  #go into directory and copy data we're interested in to that directory
  cd coverage_checkout
  mkdir ./coverage
  cp -rf $HOME/coverage/* ./coverage

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #add, commit and push files
  #[ci skip] to prevent constant build-commit-build loop.
  git add -f .
  git commit -m "Code coverage results from Travis build $TRAVIS_BUILD_NUMBER pushed to git repository. [ci skip]"
  git push -fq origin master > /dev/null

  echo -e "Code coverage results moved to git.\n"
fi

#same thing for github public pages
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Pushing code coverage data to git public pages.\n"

  #copy data we're interested in to other place
  cp -r coverage $HOME/coverage

  git clone --quiet --branch=gh-pages https://2010976e1624b3640941858b87501f4560066125@github.com/tcbeutler/TravisCITest.git coverage_checkout_pages > /dev/null

  #go into directory and copy data we're interested in to that directory
  cd coverage_checkout_pages
  mkdir ./coverage
  cp -rf $HOME/coverage/* ./coverage

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #add, commit and push files
  #[ci skip] to prevent constant build-commit-build loop.
  git add -f .
  git commit -m "Code coverage results from Travis build $TRAVIS_BUILD_NUMBER pushed to git repository. [ci skip]"
  git push -fq origin gh-pages > /dev/null

  echo -e "Code coverage results moved to git public pages.\n"
fi
