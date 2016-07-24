var AvailableAthleteRow = React.createClass({
  render: function() {
    var name = this.props.athlete.name;
    var adp = this.props.athlete.adp;
    return (
      <tr>
        <td>{adp}</td>
        <td>{name}</td>
      </tr>
    );
  }
});
