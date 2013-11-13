if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Pushing code coverage data to git.\n"

  git clone --quiet --branch=master https://2010976e1624b3640941858b87501f4560066125@github.com/tcbeutler/TravisCITest.git coverage_checkout > /dev/null

  #go into directory and copy data we're interested in to that directory
  cd coverage_checkout
  cp -rf $HOME/coverage/* .

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #add, commit and push files
  git add -f .
  git commit -m "Code coverage results from Travis build $TRAVIS_BUILD_NUMBER pushed to git repository."
  git push -fq origin master > /dev/null

  echo -e "Code coverage results moved to git.\n"
fi