import { searchCharacter, getCompanions } from "./main_functions.js"

const character = await searchCharacter("attila")

const companions = await getCompanions("attila")

console.log(character)

console.log(companions)



