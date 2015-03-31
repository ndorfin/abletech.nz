// Provide month names
Date.prototype.getMonthName = function(){
    var month_names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return month_names[this.getMonth()];
}

// format provided date into this.format format
Date.prototype.format = function(dateFormat){
    // break apart format string into array of characters
    dateFormat = dateFormat.split("");

    var date = this.getDate(),
        month = this.getMonth();

    // get all date properties ( based on PHP date object functionality )
    var date_props = {
        d: date < 10 ? '0'+date : date,
        j: this.getDate(),
        w: this.getDay(),
        F: this.getMonthName(),
        m: month < 10 ? '0'+(month+1) : month+1,
        n: month+1,
        Y: this.getFullYear(),
        y: this.getFullYear()+''.substring(2,4)
    };

    // loop through format array of characters and add matching data else add the format character (:,/, etc.)
    var date_string = "",
        i = 0,
        formatLength = dateFormat.length;
    for(i;i<formatLength;i++){
        var f = dateFormat[i];
        if(f.match(/[a-zA-Z]/g)){
            date_string += date_props[f] ? date_props[f] : '';
        } else {
            date_string += f;
        }
    }
    return date_string;
};
