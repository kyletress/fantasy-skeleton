var AvailableAthletes = React.createClass({
  getInitialState: function() {
    return {
      filterText: ''
    };
  },

  handleUserInput: function(filterText) {
    this.setState({
      filterText: filterText
    });
  },

  render: function() {
    return (
      <div class="hello">
        <SearchBar
          filterText={this.state.filterText}
          onUserInput={this.handleUserInput}
        />
        <AvailableAthleteTable
          athletes={ATHLETES}
          filterText={this.state.filterText}
        />
      </div>
    );
  }
});

var ATHLETES = [
  {name: "Kyle Tress", adp: "1"},
  {name: "Matt Antoine", adp: "2"},
  {name: "Morgan Tracey", adp: "3"}
]
