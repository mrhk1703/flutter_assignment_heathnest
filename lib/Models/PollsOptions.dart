class PollOptions {
	String optionName;
	List<String> voting;

	PollOptions({this.optionName, this.voting});

	PollOptions.fromJson(Map<String, dynamic> json) {
		optionName = json['optionName'];
		voting = json['voting'].cast<String>();
	}

}