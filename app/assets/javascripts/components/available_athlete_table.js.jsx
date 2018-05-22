var AvailableAthleteTable = React.createClass({
  render: function() {
    var rows = [];
    this.props.athletes.forEach(function(athlete) {
      if (athlete.name.toLowerCase().indexOf(this.props.filterText) === -1 ) {
        return;
      }
      rows.push(<AvailableAthleteRow athlete={athlete} key={athlete.name} />);
    }.bind(this));
    return (
      <table className="table">
        <thead>
          <tr>
            <th>ADP</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>
    );
  }
});
