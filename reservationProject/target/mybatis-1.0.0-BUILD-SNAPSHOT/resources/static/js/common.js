
function getYmd(date) {
    let d = new Date(date);
    return (
        (d.getFullYear() % 100) +
        "-" +
        (d.getMonth() + 1 > 9
            ? (d.getMonth() + 1).toString()
            : "0" + (d.getMonth() + 1)) +
        "-" +
        (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString())
    );
}