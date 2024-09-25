
const MAX = 300;

function fizz(n) {
    var randomDelay = Math.round(Math.random() * 3000) + 100;

    n % 3 == 0 || n.toString().match("3") ?
    setTimeout(
        () => console.log("fizz"),
        randomDelay
    )
    : console.log(n)
}


for (let i = 1; i < MAX; i++) fizz(i);