set export

OPEN_API_MAKER_FORMULA := "Formula/open_api_maker.rb"

default:
  just --list

formulate:
    #!/bin/zsh

    . .venv/bin/activate
    poet -f open-api-maker-kamaalio > $OPEN_API_MAKER_FORMULA
    open_api_maker_formula=$(sed 's/OpenApiMakerKamaalio/OpenApiMaker/g' $OPEN_API_MAKER_FORMULA)
    rm $OPEN_API_MAKER_FORMULA
    touch $OPEN_API_MAKER_FORMULA
    echo $open_api_maker_formula >> $OPEN_API_MAKER_FORMULA

test-install:
    #!/bin/zsh

    export HOMEBREW_NO_INSTALL_FROM_API=1

    brew install --build-from-source --verbose --debug $OPEN_API_MAKER_FORMULA

init-venv:
    python3 -m venv .venv
    . .venv/bin/activate
    pip install -r requirements.txt