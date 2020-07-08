// Local variable
let quality = "standard";
let service;

/// Commercial data
let commercial_shaft;

/// Residential data
let residential_apartment;
let residential_floor;

// Corporate && Hybrid data
let corphyb_occupant;
let corphyb_floor;
let corphyb_basement;

$(document).ready(function () {
  hideAllForm();
  clearForm();
  // Building type change
  $("#building-select").change(function () {
    hideAllForm();
    clearForm();
    const value = $("#building-select").val();
    if (value === "Residential") {
      $("#residential-form").show();
    } else if (value === "Commercial") {
      $("#commercial-form").show();
    } else if (value === "Corporate") {
      $("#corporate-form").show();
    } else if (value === "Hybrid") {
      $("#hybrid-form").show();
    } else {
      hideAllForm();
    }
  });

  // Quality change
  $("input[name='quality-radio']").change(function () {
    quality = this.value;
    sendRequest();
  });

  // Commercial shaft change
  $("#commercial-shaft").on("input", function () {
    service = "commercial";
    commercial_shaft = this.value;
    sendRequest();
  });

  // Residential change
  $("#residential-apartment").on("input", calcResEl);
  $("#residential-floor").on("input", calcResEl);

  // Corporate change
  $("#corporate-occupant").on("input", { type: "corporate" }, calCorHybEl);
  $("#corporate-floor").on("input", { type: "corporate" }, calCorHybEl);
  $("#corporate-basement").on("input", { type: "corporate" }, calCorHybEl);

  // Hybrid change
  $("#hybrid-occupant").on("input", { type: "hybrid" }, calCorHybEl);
  $("#hybrid-floor").on("input", { type: "hybrid" }, calCorHybEl);
  $("#hybrid-basement").on("input", { type: "hybrid" }, calCorHybEl);

  // Validator
  /// Basic
  $("#building-name").on("input", function () {
    const valid = validator.isEmpty(this.value);
    const input = $("#building-name");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#building-email").on("input", function () {
    const valid = !validator.isEmail(this.value);
    const input = $("#building-email");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#building-phone").on("input", function () {
    const valid = !validator.isMobilePhone(this.value, "en-CA");
    const input = $("#building-phone");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#building-business").on("input", function () {
    const valid = validator.isEmpty(this.value);
    const input = $("#building-business");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#building-project").on("input", function () {
    const valid = validator.isEmpty(this.value);
    const input = $("#building-project");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#building-select").change(function () {
    const valid = validator.isEmpty(this.value);
    const input = $("#building-select");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  /// Residential
  $("#residential-apartment").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#residential-apartment");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#residential-floor").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#residential-floor");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#residential-basement").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#residential-basement");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  /// Commercial
  $("#commercial-business").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#commercial-business");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#commercial-floor").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#commercial-floor");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#commercial-basement").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#commercial-basement");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#commercial-parking").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#commercial-parking");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#commercial-shaft").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#commercial-shaft");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  /// Corporate
  $("#corporate-companies").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#corporate-companies");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#corporate-floor").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#corporate-floor");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#corporate-basement").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#corporate-basement");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#corporate-parking").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#corporate-parking");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#corporate-occupant").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#corporate-occupant");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  /// Hybrid
  $("#hybrid-business").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#hybrid-business");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#hybrid-floor").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#hybrid-floor");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#hybrid-basement").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#hybrid-basement");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#hybrid-parking").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#hybrid-parking");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#hybrid-occupant").on("input", function () {
    const valid = !validator.isInt(this.value);
    const input = $("#hybrid-occupant");
    valid ? input.addClass("error") : input.removeClass("error");
  });
  $("#hybrid-active").change(function () {
    const valid = validator.isEmpty(this.value);
    const input = $("#hybrid-active");
    valid ? input.addClass("error") : input.removeClass("error");
  });
});

function hideAllForm() {
  $("#residential-form").hide();
  $("#commercial-form").hide();
  $("#corporate-form").hide();
  $("#hybrid-form").hide();
}

function clearForm() {
  // Commercial
  $("#commercial-shaft").val("");
  // Residential
  $("#residential-apartment").val("");
  $("#residential-floor").val("");
  // Corporate
  $("#corporate-occupant").val("");
  $("#corporate-floor").val("");
  $("#corporate-basement").val("");
  // Hybrid
  $("#hybrid-occupant").val("");
  $("#hybrid-floor").val("");
  $("#hybrid-basement").val("");
  // Clear price
  $("#elevator-number").text("--");
}

function calcResEl() {
  residential_apartment = $("#residential-apartment").val();
  residential_floor = $("#residential-floor").val();

  service = "residential";
  sendRequest();
}

function calCorHybEl(event) {
  corphyb_occupant = $("#" + event.data.type + "-occupant").val();
  corphyb_floor = $("#" + event.data.type + "-floor").val();
  corphyb_basement = $("#" + event.data.type + "-basement").val();
  service = event.data.type;

  sendRequest();
}

// send AJAX request to Express
function sendRequest() {
  const sentData = {
    quality,
    service,
    commercial_shaft,
    residential_apartment,
    residential_floor,
    corphyb_occupant,
    corphyb_floor,
    corphyb_basement,
  };

  $.ajax({
    type: "POST",
    url: "/quote",
    data: sentData,
  }).done(function (data) {
    updatePricing(data);
  });
}

function updatePricing(data) {
  const elevatorNb = data.elevatorNb;
  const elevatorPrice = data.elevatorPrice;
  const subtotal = data.subtotal;
  const installFee = data.installFee;
  const total = data.total;

  if (total !== "0.00") {
    $("#elevator-number").text(elevatorNb);
    $("#elevator-price").text("$ " + elevatorPrice);
    $("#elevator-subtotal").text("$ " + subtotal);
    $("#elevator-fee").text("$ " + installFee);
    $("#elevator-total").text("$ " + total);
  } else {
    $("#elevator-number").text("--");
    $("#elevator-price").text("--");
    $("#elevator-subtotal").text("--");
    $("#elevator-fee").text("--");
    $("#elevator-total").text("--");
  }
}
