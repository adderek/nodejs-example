// @ts-check

/**
 * @param {number} num
 */
function func(num) {
    console.log(num * 2);
}

func(123);
func('abc');
func(null);
func(undefined);
func(123, 456);
func();
