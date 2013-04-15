class MainController < UIViewController

  def viewDidLoad
    super
    self.title = 'BergenRB Events'

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.dataSource = self

    self.view.addSubview(@table)

    @data = []

    Event.all do |events|
      @data = events
      @table.reloadData
    end
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    decorate_cell(get_reusable_cell(tableView), @data[indexPath.row])
  end

  def tableView(tableView, numberOfRowsInSection:section)
    # return the number of rows
    @data.count
  end

  private
  def decorate_cell(cell, event)
    cell.textLabel.text = event.name
    cell
  end

  def get_reusable_cell(tableView)
    tableView.dequeueReusableCellWithIdentifier('model_cell') || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
  end
end
