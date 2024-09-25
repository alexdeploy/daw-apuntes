import { search } from "../api/pokemon-api";

export default class Pokemon {

    constructor(name){
        this.name = name.toLowerCase();
    }

    setName(name){
        this.name = name
    }

    getName(){
        return this.name
    }

    getData = () => search(this.name)

}