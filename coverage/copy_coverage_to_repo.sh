if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Pushing code coverage data to git.\n"

  #copy data we're interested in to other place
  cp -r coverage $HOME/coverage

  #go to home and setup git
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #using token clone master branch
  git clone --quiet --branch=master https://d0a0fed90970b0afe84643ad5d5725b8a063743a@github.com/tcbeutler/TravisCITest.git > /dev/null

  #go into directory and copy data we're interested in to that directory
  cd coverage
  cp -rf $HOME/coverage/* .

  #add, commit and push files
  git add -f .
  git commit -m "Code coverage results from Travis build $TRAVIS_BUILD_NUMBER pushed to git repository."
  git push -fq origin master > /dev/null

  echo -e "Code coverage results moved to git.\n"
fi