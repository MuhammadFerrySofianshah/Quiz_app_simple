// To parse this JSON data, do
//
//     final question = question(jsonString);

import 'dart:convert';

QuestionList QuestionFromJson(String str) => QuestionList.fromJson(json.decode(str));

String QuestionListToJson(QuestionList data) => json.encode(data.toJson());

class QuestionList {
    List<Datum> data;

    QuestionList({
        required this.data,
    });

    factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String question;
    dynamic optionA;
    OptionB optionB;
    OptionC optionC;
    OptionD optionD;
    String answer;
    String correctOption;

    Datum({
        required this.id,
        required this.question,
        required this.optionA,
        required this.optionB,
        required this.optionC,
        required this.optionD,
        required this.answer,
        required this.correctOption,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        optionA: json["option_a"],
        optionB: optionBValues.map[json["option_b"]]!,
        optionC: optionCValues.map[json["option_c"]]!,
        optionD: optionDValues.map[json["option_d"]]!,
        answer: json["answer "],
        correctOption: json["correct_option"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "option_a": optionA,
        "option_b": optionBValues.reverse[optionB],
        "option_c": optionCValues.reverse[optionC],
        "option_d": optionDValues.reverse[optionD],
        "answer ": answer,
        "correct_option": correctOption,
    };
}

enum OptionB {
    B,
    NAMA_SI
}

final optionBValues = EnumValues({
    "b": OptionB.B,
    "nama si": OptionB.NAMA_SI
});

enum OptionC {
    APA,
    C
}

final optionCValues = EnumValues({
    "apa": OptionC.APA,
    "c": OptionC.C
});

enum OptionD {
    D,
    KAMU
}

final optionDValues = EnumValues({
    "d": OptionD.D,
    "kamu": OptionD.KAMU
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
