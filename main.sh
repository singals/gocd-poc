case $1 in

    build)
            echo 'building'
            echo 'PHASE =' ${PHASE}
            break
            ;;

    test)
            echo 'testing'
            echo 'PHASE =' ${PHASE}
            break
            ;;
    *)
            echo 'valid options are ["build", "test"]'
esac