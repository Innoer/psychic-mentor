/* Code by Shindo. March, 2015. */

function setProgramBySchool(schoolID, selectedProgram) {
    var frag = $(document.createDocumentFragment());
    $("#programData option").each(function () {
        var prog = $(this).clone();

        if (prog.attr('schoolID') == schoolID) {
            if (prog.val() == selectedProgram)
                prog.attr('selected', 'selected');

            frag.append(prog);
        }
    });
    $("#enroll_program").html(frag);
}

function setCityByProvince(provinceID, selectedCity) {
    var frag = $(document.createDocumentFragment());

    var all = $('<option value="0" provinceID="0">（全部）</option>');
    if (selectedCity == 0) all.attr('selected', 'selected');
    frag.append(all);

    $("#cityData option").each(function () {
        var city = $(this).clone();

        if (city.attr('provinceID') == "0" || city.attr('provinceID') == provinceID) {
            if (city.val() == selectedCity)
                city.attr('selected', 'selected');

            frag.append(city);
        }
    });
    $("#live_city").html(frag);
}