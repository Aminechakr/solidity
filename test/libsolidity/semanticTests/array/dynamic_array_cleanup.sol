contract c {
    uint[20] spacer;
    uint[] dynamic;
    function fill() public {
        for (uint i = 0; i < 21; ++i)
            dynamic.push(i + 1);
    }
    function halfClear() public {
        while (dynamic.length > 5)
            dynamic.pop();
    }
    function fullClear() public { delete dynamic; }
}
// ====
// compileViaYul: also
// ----
// storage.get -> storage.empty
// fill() ->
// storage.get -> storage.nonempty
// halfClear() ->
// storage.get -> storage.nonempty
// fullClear() ->
// storage.get -> storage.empty
