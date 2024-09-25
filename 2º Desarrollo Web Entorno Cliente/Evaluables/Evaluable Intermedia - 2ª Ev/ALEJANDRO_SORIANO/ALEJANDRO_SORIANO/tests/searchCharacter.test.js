import { characters } from './fixtures/characters'
import { searchCharacter } from '../src/main_functions';

describe('searchCharacter', () => {

  it('gets the character data', () =>
    searchCharacter("attila").then((data) => {
      expect(data).toEqual(characters.attila);
  }));


  describe('when there are more than one characters', () => {
    // it('gets the first one');
  });

  describe('when there is an HTTP error', () => {
    // it('returns a rejected promise with the error');
  });

  describe('when no data is found', () => {

    it('returns "personaje no encontrado"', () =>
      searchCharacter("NombreErroneo").then((data) => {
        expect(data).toEqual(new Error("Personaje no encontrado"));
    }));

  });

});
