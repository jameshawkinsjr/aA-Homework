class Playright

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum)}
    end

    def self.find_by_name(name)
    end

    def initialize(options)
        @id = options['id']
        @play = options['play_id']
    end

    def create
        raise "#{self} already in database" if self.id
        PlayDBConnection.instance.execute(<<-SQL, self.play_id)
            INSERT INTO
                playwrights (play_id)
            VALUES
                (?)
        SQL
        self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        PlayDBConnection.instance.execute(<<-SQL, self.play_id)
            UPDATE
                playwrights (play_id)
            VALUES
                (?)
        SQL
        self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def get_plays
        PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    end


end